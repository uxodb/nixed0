{
  config,
  pkgs,
  inputs,
  ...
}: let
  useODoH = true;
  useDoH = false;
  useDNSCrypt = true;
  requireDNSSec = true;
  requireNoLog = true;
  requireNoFilter = false;
  useIPv6 = false;
  resolvers = [
    "dnscrypt.eu-nl"
    "dnscrypt.eu-dk"
    "mullvad-se"
    "mullvad-doh-se"
    "quad9-dnscrypt-ip4-filter-pri"
    "quad9-dnscrypt-ip4-filter-alt"
    # "adguard-dns"
    # "adguard-dns-family"
    "cs-fr"
    "cs-de"
    "cs-ch"
    "dnscry.pt-amsterdam"
    "odoh-cloudflare"
    "odoh-snowstorm"
  ];
  listenAddrs =
    if useIPv6
    then ["[::]:53"]
    else ["127.0.0.1:53"];

  blocklist_oisd = builtins.readFile inputs.oisd;
  blocklist_hagezi = builtins.readFile inputs.hagezi;
  blocklists_combined_txt = pkgs.writeText "blocklist.txt" ''
    ${blocklist_oisd}
    ${blocklist_hagezi}
  '';
  stateDir = "dnscrypt-proxy";
  statePath = "/var/lib/${stateDir}";
in {
  services.dnscrypt-proxy = {
    enable = true;
    upstreamDefaults = false;
    settings = {
      listen_addresses = listenAddrs;
      max_clients = 250;
      ipv4_servers = true;
      ipv6_servers = useIPv6;
      block_ipv6 = !useIPv6;
      dnscrypt_servers = useDNSCrypt;
      doh_servers = useDoH;
      odoh_servers = useODoH;
      require_dnssec = requireDNSSec;
      require_nolog = requireNoLog;
      require_nofilter = requireNoFilter;
      # disabled_server_names = [];
      server_names = resolvers;
      force_tcp = false;
      keepalive = 30;
      lb_strategy = "p2";
      lb_estimator = true;
      log_level = 3;
      log_file = "${statePath}/dnscrypt-proxy.log";
      log_file_latest = true;
      use_syslog = false;
      # log_files_max_size = 10;
      # log_files_max_age = 7;
      # log_files_max_backups = 1;
      cert_refresh_concurrency = 10;
      cert_refresh_delay = 240;
      cert_ignore_timestamp = false;
      dnscrypt_ephemeral_keys = true;
      tls_disable_session_tickets = true;
      # tls_cipher_suite = [];
      # tls_key_log_file = "/tmp/tlskeylog.txt";
      bootstrap_resolvers = ["9.9.9.9:53" "1.1.1.1:53"];
      ignore_system_dns = true;
      netprobe_timeout = 60;
      netprobe_address = "9.9.9.9:53";
      offline_mode = false;
      block_unqualified = true;
      block_undelegated = true;
      reject_ttl = 10;
      # forwarding rules = "forwarding_rules.txt";
      # cloaking_rules = "cloaking_rules.txt";
      # cloak_ttl = 600;
      # cloak_ptr = false;
      cache = true;
      cache_size = 4096;
      cache_min_ttl = 2400;
      cache_max_ttl = 86400;
      cache_neg_min_ttl = 60;
      cache_neg_max_ttl = 600;
      query_log = {
        file = "${statePath}/query.log";
        format = "tsv";
      };
      nx_log = {
        file = "${statePath}/nx.log";
        format = "tsv";
      };
      blocked_names = {
        blocked_names_file = "${blocklists_combined_txt}";
        log_file = "${statePath}/blocked-names.txt";
        log_format = "tsv";
      };
      # blocked_ips = {
      #   blocked_ips_file = "";
      #   log_file = "";
      #   log_format = "tsv";
      # };
      sources = {
        public-resolvers = {
          urls = [
            "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
            "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
          ];
          cache_file = "${statePath}/public-resolvers.md";
          minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
          refresh_delay = 73;
          prefix = "";
        };
        relays = {
          urls = [
            "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/relays.md"
            "https://download.dnscrypt.info/resolvers-list/v3/relays.md"
          ];
          cache_file = "${statePath}/relays.md";
          minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
          refresh_delay = 73;
          prefix = "";
        };
        odoh-servers = {
          urls = [
            "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/odoh-servers.md"
            "https://download.dnscrypt.info/resolvers-list/v3/odoh-servers.md"
          ];
          cache_file = "${statePath}/odoh-servers.md";
          minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
          refresh_delay = 73;
          prefix = "";
        };
        odoh-relays = {
          urls = [
            "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/odoh-relays.md"
            "https://download.dnscrypt.info/resolvers-list/v3/odoh-relays.md"
          ];
          cache_file = "${statePath}/odoh-relays.md";
          minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
          refresh_delay = 73;
          prefix = "";
        };
      };
      anonymized_dns = {
        skip_incompatible = true;
        routes = [
          {
            server_name = "odoh-snowstorm";
            via = ["odohrelay-crypto-sx"];
          }
          {
            server_name = "odoh-cloudflare";
            via = ["odohrelay-crypto-sx"];
          }
          {
            server_name = "dnscrypt.eu-nl";
            via = ["anon-cs-nl" "dnscry.pt-anon-naaldwijk-ipv4"];
          }
          {
            server_name = "dnscrypt.eu-dk";
            via = ["anon-cs-norway" "dnscry.pt-anon-copenhagen-ipv4"];
          }
          {
            server_name = "mullvad-se";
            via = ["anon-cs-swe" "dnscry.pt-anon-stockholm02-ipv4"];
          }
          {
            server_name = "mullvad-doh-se";
            via = ["anon-cs-finland" "dnscry.pt-anon-helsinki-ipv4"];
          }
          {
            server_name = "quad9-dnscrypt-ip4-filter-pri";
            via = ["anon-cs-de" "dnscry.pt-anon-frankfurt02-ipv4"];
          }
          {
            server_name = "quad9-dnscrypt-ip4-filter-alt";
            via = ["anon-cs-fr" "dnscry.pt-anon-paris-ipv4"];
          }
          {
            server_name = "cs-fr";
            via = ["dnscry.pt-anon-paris-ipv4" "anon-scaleway"];
          }
          {
            server_name = "cs-de";
            via = ["dnscry.pt-anon-frankfurt02-ipv4" "anon-digitalprivacy.diy-ipv4"];
          }
          {
            server_name = "cs-ch";
            via = ["dnscry.pt-anon-geneva-ipv4" "anon-kama"];
          }
          {
            server_name = "dnscry.pt-amsterdam";
            via = ["anon-cs-nl" "anon-serbica"];
          }
        ];
      };
    };
  };
  systemd.services.dnscrypt-proxy.serviceConfig.StateDirectory = stateDir;
}

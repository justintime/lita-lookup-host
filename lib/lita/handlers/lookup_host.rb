module Lita
  module Handlers
    class LookupHost < Handler
      route(
        /^lookup host\s+(?<host>\S+)/,
        :resolve,
        command: true,
        help: {
          t('help.resolve.syntax') => t('help.resolve.desc')
        }
      )

      def resolve(response)
        host     = response.match_data['host']
        log.debug("Host to resolve is '#{host}'")
        response.reply(lookup(host))
      end

      private

      def lookup(host)
        require 'resolv'
        if host =~ /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/
          log.debug("Doing a reverse lookup of #{host}")
          results = Resolv.new.getnames(host).join("\n")
        else
          log.debug("Doing a forward lookup of #{host}")
          results = Resolv.new.getaddresses(host).join("\n")
        end
        if results.empty?
          return "No DNS info found for #{host}"
        end
        results
      end

    end
  Lita.register_handler(LookupHost)
  end
end

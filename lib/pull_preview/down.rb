module PullPreview
  class Down
    def self.run(cli_args)
      opts = Slop.parse do |o|
        o.banner = "Usage: pullpreview down [options]"
        o.string '--name', 'Name of the environment to destroy', required: true
        o.bool '-v', '--verbose', 'Enable verbose mode'
        o.on '--help' do
          puts o
          exit
        end
      end

      if opts.verbose?
        PullPreview.logger.level = Logger::DEBUG
      end

      instance = Instance.new(opts[:name])
      instance.destroy!
    end
  end
end

# Aruba
module Aruba
  # ScriptFile
  class ScriptFile
    class AbstractScript
      def initialize(path, content)
        @path = path
        @content = content
      end

      def match?(matcher)
        matcher == name
      end

      def name
        raise Error, 'Name must be redefined'
      end

      def header
        "#!/usr/bin/env #{name}"
      end

      def call
        text = "#{header}\n#{@content}"
        Aruba.platform.write_file(@path, text)
        Aruba.platform.chmod('0755', @path)
      end
    end

    class ZshFile < AbstractScript
      def self.name
        'zsh'
      end
    end

    class BashFile < AbstractScript
      def self.name
        'bash'
      end
    end

    class DashFile < AbstractScript
      def self.name
        'dash'
      end
    end

    class FishFile < AbstractScript
      def self.name
        'fish'
      end
    end

    class NullShellFile
      def self.match?(*)
        raise ArgumentError, 'Invalid input'
      end
    end

    def initialize(opts = {})
      @generators = []
      @generators << ZshFile
      @generators << BashFile
      @generators << FishFile
      @generators << DashFile
      @generators << NullShellFile
      @generator = @generators.find { |g| g.match? opts[:generator] }

      @gen = @generator.new opts[:path], opts[:content]
    end

    def call
      @gen.call
    end
  end
end

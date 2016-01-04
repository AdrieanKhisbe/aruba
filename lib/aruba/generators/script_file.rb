# Aruba
module Aruba
  # ScriptFile
  class ScriptFile
    def initialize(opts = {})
      @path        = opts[:path]
      @content     = opts[:content]
      @interpreter = opts[:interpreter]
    end

    def call
      script_content = script_starts_with_shebang? ? @content : "#{header}#{@content}"
      Aruba.platform.write_file(@path, script_content)
      Aruba.platform.chmod(0755, @path, {})
    end

    private

    def header
      if script_starts_with_shebang?
        ''
      elsif interpreter_is_absolute_path?
        format("#!%s\n", @interpreter)
      elsif interpreter_is_just_the_name_of_shell?
        format("#!/usr/bin/env %s\n", @interpreter)
      end
    end

    def interpreter_is_absolute_path?
      Aruba.platform.absolute_path? @interpreter
    end

    def interpreter_is_just_the_name_of_shell?
      @interpreter == /^[-_a-zA-Z.]+$/
    end

    def script_starts_with_shebang?
      @content.start_with? '#!'
    end

  end
end

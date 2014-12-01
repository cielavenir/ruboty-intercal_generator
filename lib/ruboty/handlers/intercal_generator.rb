require "ruboty/intercal_generator/actions/generate"

module Ruboty
  module Handlers
    class IntercalGenerator < Base
      on /intercal (?<text>.*)/, name: 'intercal', description: 'generate intercal code'

      def intercal(message)
        Ruboty::IntercalGenerator::Actions::Generate.new(message).call
      end
    end
  end
end

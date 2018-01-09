module Jekyll
  module StealthyShare
    class Template
      class << self
        extend Forwardable
        def_delegator StealthyShare, :templates_path

        def basenames
          all.map(&File.public_method(:basename)).sort
        end

        def read(*basenames)
          basenames.map do |basename|
            File.read(File.join(templates_path, basename))
          end
        end

        private

        def all
          Dir.glob(File.join(templates_path, '[!_]*.html'))
        end
      end
    end
  end
end

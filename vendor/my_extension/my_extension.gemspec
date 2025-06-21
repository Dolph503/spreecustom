require_relative "lib/my_extension/version"

Gem::Specification.new do |spec|
  spec.name        = "my_extension"
  spec.version     = MyExtension::VERSION
  spec.authors     = ["Umer Bilal"]
  spec.email       = ["umerbilal.techno@gmail.com"]
  spec.homepage    = "https://github.com/your-username/my_extension"  # Optional but recommended
  spec.summary     = "A brief summary of MyExtension"  # <-- Add a valid summary here
  spec.description = "A longer description of MyExtension."  # Optional, but good to have
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/your-username/my_extension"  # Replace with your actual URL
  spec.metadata["changelog_uri"] = "https://github.com/your-username/my_extension/blob/main/CHANGELOG.md"  # Optional

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.1.5.1"
end

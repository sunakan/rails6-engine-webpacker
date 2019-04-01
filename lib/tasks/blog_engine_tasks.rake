# desc "Explaining what the task does"
task :blog_engine do
  # Task goes here

  namespace :blog_engine do
    namespace :webpacker do
      desc "Install deps with yarn"
      task :yarn_install do
        Dir.chdir(File.join(__dir__, "../..")) do
          system "yarn install --no-progress --production"
        end
      end

      desc "Compile JavaScript packs using webpack for production with digests"
      task compile: [:yarn_install, :environment] do
        Webpacker.with_node_env("production") do
          if BlogEngine.webpacker.commands.compile
            # Successful compilation!
          else
            # Failed compilation
            exit!
          end
        end
      end
    end
  end

end

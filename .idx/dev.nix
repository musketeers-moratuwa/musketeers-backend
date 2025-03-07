{ pkgs, ... }: {
    # Which nixpkgs channel to use.
      channel = "stable-24.05"; # or "unstable"

        # Use https://search.nixos.org/packages to find packages
          packages = [
              pkgs.jdk21 # or a specific JDK version like pkgs.jdk8, pkgs.jdk17
                  pkgs.maven # For building and managing Java projects with Maven
                      pkgs.gradle # For building and managing Java projects with Gradle (alternative to Maven)
                          pkgs.git # Version control system
                              # pkgs.go
                                  # pkgs.python311
                                    ];

                                      # Environment variables (optional, but often useful for Java development)
                                        env = {
                                            JAVA_HOME = "${pkgs.jdk21}"; # Set JAVA_HOME to the JDK package path
                                                # MAVEN_HOME = "${pkgs.maven}"; # If you use Maven, you might want to set MAVEN_HOME as well
                                                  };

                                                    # Devtools (optional, for running development servers etc. within the environment)
                                                      shellHook = ''
                                                          # Example: Start a Spring Boot backend development server (adjust command as needed)
                                                              watch-backend = "mvn spring-boot:run"; # Example for Maven, adjust if using Gradle
                                                                '';

                                                                  # VSCode extensions (optional, for recommending extensions when opening the project in VSCode)
                                                                    vscode.extensions.recommendations = [
                                                                        "vscjava.vscode-java-pack" # Essential Java Extension Pack for VSCode
                                                                            "pivotal.vscode-spring-boot" # Spring Boot Extension Pack for VSCode
                                                                                # Add other relevant extensions as needed
                                                                                  ];

                                                                                    devShells.default = {
                                                                                        # Add any commands you want to run when entering the Nix shell
                                                                                            initHook = ''
                                                                                                  echo "Welcome to the Java Spring Boot Nix development environment!"
                                                                                                        echo "Java version: $(java -version)"
                                                                                                              echo "Maven version: $(mvn -version)" # If Maven is included
                                                                                                                    echo "Gradle version: $(gradle --version)" # If Gradle is included
                                                                                                                        '';

                                                                                                                            # Commands available in the development shell
                                                                                                                                commands = [
                                                                                                                                      {
                                                                                                                                              name = "run-backend";
                                                                                                                                                      command = "mvn spring-boot:run"; # Or "gradle bootRun" if using Gradle
                                                                                                                                                              help = "Run the Spring Boot backend application";
                                                                                                                                                                    }
                                                                                                                                                                          # Add other development commands as needed
                                                                                                                                                                              ];

                                                                                                                                                                                  # Optionally, include devtools here as well if you want them directly accessible in the shell
                                                                                                                                                                                      # devtools = {
                                                                                                                                                                                          #   watch-backend = "mvn spring-boot:run";
                                                                                                                                                                                              # };
                                                                                                                                                                                                };
                                                                                                                                                                                                }
}}
// This is the official installer for SpaceBusOS.
extern crate clap;
use clap::{Arg, App, SubCommand};
use run_script::ScriptOptions;

mod ui;

fn main() {

    // Defining the CLI framework. This incueds the subcommand install,
    let matches = App::new("SpaceBusOS installer")
                          .version("1.0")
                          .author("Fedx <fedx-sudo@pm.me>")
                          .about("The installer for the most portable and modular distor ever.")

                          .subcommand(SubCommand::with_name("install")
                                      .about("Installs a SpaceBusOS config.")

                                        .arg(Arg::with_name("edition")
                                            .short("e")
                                            .long("edition")
                                            .help("Sets the version of SBOS to install.
                                            Desktop - The official SBOS desktop eddition")
                                            .takes_value(true))

                                        .arg(Arg::with_name("config")
                                            .short("c")
                                            .long("config")
                                            .value_name("FILE")
                                            .help("Sets a custom config file")
                                            .takes_value(true))

                                        .arg(Arg::with_name("no-config")
                                            .help("Does not overwrite existing config files")
                                            .long("no-config"))

                                        .arg(Arg::with_name("verbose")
                                            .long("verbose")
                                            .short("v")
                                            .multiple(true)
                                            .help("Sets the level of verbosity"))
                                            )



                            .get_matches();

    if let Some(matches) = matches.subcommand_matches("install") {
        println!("Startting the SBOS installer");

        let options = ScriptOptions::new();
        let args = vec![];
        let mut config = "not-set";
       if  matches.value_of("config").unwrap_or("not-found") != "not-found" {
            config = matches.value_of("config").unwrap_or("error");
       }
        else if matches.value_of("edition").unwrap_or("not-found") != "not-found" {
            config = matches.value_of("edition").unwrap_or("error");
        }

        else {
            println! ("You must provide either an eddition or a config file.");
            std::process::exit(1)
        }

        let (code, output, error) = run_script::run(
            r#"
            brl version
            "#,
        &args,
        &options,
        )
        .unwrap();

        if  code != 0 {
            println! ("An error has occured.");
            println! ("Error: {}", error);
            std::process::exit(1);
        }

        else if  output.contains("Bedrock Linux 0.7.22 Poki" ){
            println! ("Bedrock Linux is installed and up to date");
        }
        else if  output.contains("Bedrock Linux"){
            println! ("Bedrock Linux is installed, but not up to date. Please update Bedrock Linux to continue");
            std::process::exit(1);
        }

        else {
            println! ("an unexpected error has occured");
            println! ("Error: {}", error);
            std::process::exit(1);

        }


    }
}


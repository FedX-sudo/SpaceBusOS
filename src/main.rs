// This is the official installer for SpaceBusOS.
extern crate clap;
use clap::{Arg, App, SubCommand};
use run_script::ScriptOptions;


fn main() {
    let matches = App::new("SpaceBusOS installer")
                          .version("1.0")
                          .author("Fedx <fedx-sudo@pm.me>")
                          .about("The installer for the most portable and modular distor ever.")

                          .subcommand(SubCommand::with_name("install")
                                      .about("installs a SpaceBusOS config.")
                                        .arg(Arg::with_name("config")
                                            .short("c")
                                            .long("config")
                                            .value_name("FILE")
                                            .help("Sets a custom config file")
                                            .takes_value(true))
                                        .arg(Arg::with_name("no-config")
                                            .help("Does not overwrite existing config files")
                                            .long("no-config")
                                            .takes_value(true))
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

        let (code, output, error) = run_script::run(
            r#"
            brl version
            "#,
        &args,
        &options,
        )
        .unwrap();

        if ( code != 0 ){
            println! ("an unexpected error has occured.");
            println! ("Error: {}", error);
        }

        else if ( output.contains("Bedrock Linux 0.7.22 Poki" )){
            println! ("Bedrock Linux is installed and up to date");
        }

        else {
            println! ("an unexpected error has occured/");

        }

    }
}


// This is the official installer for SpaceBusOS.
extern crate clap;
use anyhow::{Context, Result};
use clap::{App, Arg, SubCommand};

mod command_check;
mod config;

fn main() {
    // Defining the CLI framework. This incueds the subcommand install,
    let matches = App::new("SpaceBusOS installer")
        .version("1.0")
        .author("Fedx <fedx-sudo@pm.me>")
        .about("The installer for the most portable and modular distor ever.")
        .subcommand(
            SubCommand::with_name("install")
                .about("Installs a SpaceBusOS config.")
                .arg(
                    Arg::with_name("edition")
                        .short("e")
                        .long("edition")
                        .help(
                            "Sets the version of SBOS to install.
                                            Desktop - The official SBOS desktop eddition",
                        )
                        .takes_value(true),
                )
                .arg(
                    Arg::with_name("config")
                        .short("c")
                        .long("config")
                        .value_name("FILE")
                        .help("Sets a custom config file")
                        .takes_value(true),
                )
                .arg(
                    Arg::with_name("no-config")
                        .help("Does not overwrite existing config files")
                        .long("no-config"),
                )
                .arg(
                    Arg::with_name("verbose")
                        .long("verbose")
                        .short("v")
                        .multiple(true)
                        .help("Sets the level of verbosity"),
                ),
        )
        .get_matches();

    if let Some(matches) = matches.subcommand_matches("install") {
        println!("Startting the SBOS installer");
        let mut config = "not-set";

        if matches.value_of("config").unwrap_or("not-found") != "not-found" {
            config = matches.value_of("config").unwrap_or("error");
        } else if matches.value_of("edition").unwrap_or("not-found") != "not-found" {
            config = matches.value_of("edition").unwrap_or("error");
        } else {
            println!("You must provide either an eddition or a config file.");
            std::process::exit(1)
        }
        println!("{}", command_check::Check_BRL())
    }
}

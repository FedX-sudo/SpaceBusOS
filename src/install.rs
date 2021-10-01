use run_script::ScriptOptions;
use toml::Value;
use std::fs;
extern crate serde_derive;

#[derive(Debug, Deserialize)]
struct Outer {
    entry: Vec<Entry>,
}

#[derive(Debug, Deserialize)]
struct Entry {
    foo: String,
    bar: String,
}

pub fn config (filename: String){
    let value = "foo = 'bar'".parse::<Value>().unwrap();
	let toml_string = fs::read_to_string(filename)
        .expect("Something went wrong reading the file");

	if toml_string.contains("Something went wrong reading the file"){
			println!("ERROR: Something went wrong reading the file");
			std::process::exit(2)
		}

	let config: Outer = toml::from_str(&toml_string)?;

}

pub fn run () {
    let options = ScriptOptions::new();
    let args = vec![];

    let (code, output, mut error) = run_script::run(
        r#"
        brl version
        "#,
        &args,
        &options,
    ).unwrap();

    if code != 0 {

        println!("An unexpected error has occured.");
        std::process::exit(1)
    }

    else if output.contains("Bedrock Linux 0.7.22 Poki") {
        println!("Bedrock Linux is installed and up to date.")
    }

    else if output.contains("Bedrock Linux") { 
        println!("Bedrock Linux is installed, but needs to be updated");
        std::process::exit(1)
    }

    else {
        println!("An unexpected error has occured.");
        std::process::exit(1)
    }




}

/*use toml::Value;
use std::env;
use std::fs;

fn open (path) -> Result<Value, Error>{
	let value = "foo = 'bar'".parse::<Value>().unwrap();
	let contents = fs::read_to_string(filename)
        .expect("Something went wrong reading the file");
	
	if contents.contains("Something went wrong reading the file"){
			Err("ERROR: Something went wrong reading the file");
		}
	let config: toml::Value = toml::from_str(&toml_string)?;
	
}*/


pub fn run () {
    println!("code goes here.")
}

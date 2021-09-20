use anyhow::{Error, Result, bail};
use run_script::ScriptOptions;


pub fn Check_BRL() -> Result<bool, Error>{
    let options = ScriptOptions::new();
    let args = vec![];
    let mut out = ("This is a bad error which should never happon, if you are reading this, please submit a bug to github.com/fedx-sudo/SpaceBusOS").to_string();

    let (code, output, mut error) = run_script::run(
        r#"
        brl version
        "#,
        &args,
        &options,
    )
    .unwrap();
    error = error.to_string();
    
    if code != 0 {
        
        bail!( "An error has occured. Error: {}", error)
    } 
    
    else if output.contains("Bedrock Linux 0.7.22 Poki") {
        Ok(true)
    } 
    
    else if output.contains("Bedrock Linux") {
        bail!("Bedrock Linux is installed, but not up to date. Please update Bedrock Linux to continue")
    }
    
    else {
        bail!("an unexpected error has occured Error: {}", error)
    }
}


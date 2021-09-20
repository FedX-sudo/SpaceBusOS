/*use anyhow::{Context, Result};
use run_script::ScriptOptions;
use std::error::Error;

pub fn Check_BRL() -> Result<()> {
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
        it.detach().context("This is an error which should not occure. Please report this bug to github.com/fedx-sudo/SpaceBusOS.")?;
        let out = (
            "An error has occured.
        Error: {}",
            error,
        );
        Err(out);
    } else if output.contains("Bedrock Linux 0.7.22 Poki") {
        Ok("Bedrock Linux is installed and up to date");
    } else if output.contains("Bedrock Linux") {
        Ok("Bedrock Linux is installed, but not up to date. Please update Bedrock Linux to continue");
    } else {
        let out = (
            "an unexpected error has occured
        Error: {}",
            error,
        );

        Err(out);
    }
}
*/

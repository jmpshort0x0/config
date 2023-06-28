$POSH_THEMES_PATH = "C:\Users\<user>\AppData\Local\Programs\oh-my-posh\themes\"

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/clean-detailed.omp.json" | Invoke-Expression

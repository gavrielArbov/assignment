function LogError {
    param ($Message)
  
    Write-Output "ERROR -- $($Message)"
    Write-Output "";
  }
  
function LogStep {
    param ($Message)
  
    Write-Output "[x] $($Message)"
    Write-Output "";
}


try{
    if (Test-Path -Path venv) {
        LogStep("Removing existing venv")
        Remove-Item -r venv
    }
    LogStep("Creating venv for python")
    # Set-ExecutionPolicy RemoteSigned
    py -m venv venv
    .\venv\Scripts\activate
    py -m pip install requests
    py -m pip install pytest
} catch {
    LogError("Failed to intialized venv for python")
    exit(1)
}

LogStep("Intialized venv for python")
# output markdown from Errors, Warnings, and Alerts of a deploy report
# passes the markdown deployreport.md file
# ## Errors
# - Error
# - Error
# ## Warnings
# - Warning
# - Warning
# ## Alerts
# - Alert.Name
#   - Issue.Value

param(
  [Parameter(Mandatory=$true)]
  [string]$deployReportFile,

  [Parameter(Mandatory=$false)]
  [bool]$debugMode = $False
)

if ($debugMode) {
    Write-Host "Deploy report file: $deployReportFile"
}

# Load the XML file
[xml]$xml = Get-Content $deployReportFile
$deployReport = $xml.DeploymentReport
$markdownOutput = ""

# if there are errors, write them to the output
$errors = $deployReport.Errors.Error
$warnings = $deployReport.Warnings.Warning
$alerts = $deployReport.Alerts.Alert
$errorsCount = $errors.Count
$warningsCount = $warnings.Count
$alertsCount = $alerts.Count

# Write the errors to the output
if ($errorsCount -gt 0) {
    $markdownOutput += "## 🛑 Deploy Report Errors`n`n"
    if ($debugMode) {
        Write-Host "## 🛑 Deploy Report Errors"
    }
    foreach ($error in $errors) {
        if ($debugMode) {
            Write-Host "- $($error)"
        }
        $markdownOutput += "- $($error)`n"

    }
} else {
    if ($debugMode) {
        Write-Host "✅ No deploy report errors found."
    }
    $markdownOutput += "✅ No deploy report errors found.`n`n"
}

# Write the warnings to the output
if ($warningsCount -gt 0) {
    $markdownOutput += "## ⚠️ Deploy Report Warnings`n`n"
    if ($debugMode) {
        Write-Host "## ⚠️ Deploy Report Warnings"
    }
    foreach ($warning in $warnings) {
        if ($debugMode) {
            Write-Host "- $($warning)"
        }
        $markdownOutput += "- $($warning)`n"
    }
} else {
    if ($debugMode) {
        Write-Host "✅ No deploy report warnings found."
    }
    $markdownOutput += "✅ No deploy report warnings found.`n`n"
}

# write the alerts to the output
if ($alertsCount -gt 0) {
    $markdownOutput += "## ⚠️ Alerts`n`n"
    if ($debugMode) {
        Write-Host "## ⚠️ Alerts"
    }
    foreach ($alert in $alerts) {
        $thisAlert = $alert.Name
        foreach ($issue in $alert.Issue) {
            if ($debugMode) {
                Write-Host "- $($thisAlert): $($issue.Value)"
            }
            $markdownOutput += "- $($thisAlert): $($issue.Value)`n"
        }
    }
} else {
    if ($debugMode) {
        Write-Host "✅ No deploy report alerts found."
    }
    $markdownOutput += "✅ No deploy report alerts found.`n`n"
}

# Write the markdown output to the deployreport.md file
# This will be used to display the output in the GitHub Actions UI
$deployReportFile = "deployreport.md"
$markdownOutput | Out-File -FilePath $deployReportFile -Encoding utf8

# Write the markdown output to the console
if ($debugMode) {
    Write-Host $markdownOutput
}
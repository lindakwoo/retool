const failedSteps = content_generation_failed_steps.data;

async function fetchAllLogs() {
  const allLogs = [];

  for (const step of failedSteps) {
    const result = await content_generation_failed_stdout.trigger({
      additionalScope: {
        currentStepKey: step.stepKey
      }
    });
    console.log(result)
    allLogs.push({
      step: step.stepKey,
      stdout: result.pipelineRunOrError.computeLogs?.stdout?.data || "No stdout found",
      stderr: result.pipelineRunOrError.computeLogs?.stderr?.data || ""
    });
  }

  return allLogs;
}

return fetchAllLogs();
def startDataflowProcess(data, context):
	from googleapiclient.discovery import build
	#replace with your projectID
	project = "sandbox-257707"
	job = "called-from-a-cloud-function-batch-pipeline" + " " + str(data['timeCreated'])
	#path of the dataflow template on google storage bucket
	template = "gs://terra-qwiklabs/template/pipeline"
	inputFile = "gs://" + str(data['bucket']) + "/" + str(data['name'])
	#user defined parameters to pass to the dataflow pipeline job
	parameters = {
		'inputFile': inputFile,
	}
	#tempLocation is the path on GCS to store temp files generated during the dataflow job
	environment = {'tempLocation': 'gs://terra-qwiklabs/temp-location'}

	service = build('dataflow', 'v1b3', cache_discovery=False)
	#below API is used when we want to pass the location of the dataflow job
	request = service.projects().locations().templates().launch(
		projectId=project,
		gcsPath=template,
		location='us-central1',
		body={
			'jobName': job,
			'parameters': parameters,
			'environment':environment
		},
	)
	response = request.execute()
	print(str(inputFile))

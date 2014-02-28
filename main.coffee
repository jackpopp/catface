videoInput = null
canvasVideo = null
canvasPaint = null
paintContext = null

img = null

windowHeight = window.innerHeight
windowWidth = window.innerWidth

getElements = ->
	videoInput = document.getElementById('input-video')
	canvasVideo = document.getElementById('canvas-video')
	canvasPaint = document.getElementById('canvas-paint')
	img = document.getElementById('img')
	paintContext = canvasPaint.getContext('2d')
	return

setElementSizes = ->
	windowHeight = window.innerHeight
	windowWidth = window.innerWidth

	videoInput.style.height = windowHeight
	videoInput.style.width = windowWidth

	canvasVideo.style.height = windowHeight
	canvasVideo.style.width = windowWidth

	canvasPaint.style.height = windowHeight
	canvasPaint.style.width = windowWidth
	return

setEventListeners = ->
	document.addEventListener('facetrackingEvent', (event) ->
		console.log event.height
		facePaint(event.height, event.width, event.angle, event.x, event.y)
		return
	)

	window.onresize = -> setElementSizes()
	window.addEventListener('onresize', -> setElementSizes())
	return

facePaint = (height, width, angle, x, y) ->
	paintContext.clearRect(0, 0, windowWidth, windowHeight)
	paintContext.drawImage(img, x - (width/2), y - (height/2), width, height)
	return

init = ->
	getElements()
	setElementSizes()
	setEventListeners()

	htracker = new headtrackr.Tracker({ui: false})
	htracker.init(videoInput, canvasVideo)
	htracker.start()
	return

init()
express = require "express"
lessMiddleware = require "less-middleware"


app = express()

#logging via morgan
morgan = require "morgan"
app.use morgan('tiny')


app.use(lessMiddleware(__dirname + '/less'));
app.use(express.static(__dirname + '/less'));




#Set up Ect template engine
ECT = require "ect"
ectRenderer = ECT
    watch : true
    root  : __dirname + '/views'
    ext   : '.ect'

#apply to express view engine
app.set 'view engine', 'ect'
app.engine 'ect', ectRenderer.render


app.use express.static("images")
#routing
app.get '/', (req,res)->
    res.render 'index'

#listen for requests    
app.listen(process.env.PORT)
console.log "Application Running on port #{process.env.PORT}"
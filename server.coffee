express = require "express"
app = express()

#logging via morgan
morgan = require "morgan"
app.use morgan('combined')

#Set up Ect template engine
ECT = require "ect"
ectRenderer = ECT
    watch : true
    root  : __dirname + '/views'
    ext   : '.ect'

#apply to express view engine
app.set 'view engine', 'ect'
app.engine 'ect', ectRenderer.render

#testing
content = require "./content/home"
console.log content.Content.Home.p2


navlinks = require "./content/navlinks"

#routing
app.get '/', (req,res)->
    res.render 'index', navlinks

#listen for requests    
app.listen(process.env.PORT);
console.log 'Renderer ready'
express = require 'express'
app = express()
app.locals.pretty = true


app.use '/static', express.static __dirname + '/../'

app.get '/', (req, res) ->
    today = new Date
    lastSevenDays = (daysAgo(today, i) for i in  [0...7]).map(getYymmdd)
    hhs = [0...24].map (x)->pudding x, 2
    console.log hhs
    res.render 'hello.jade', {
        sevenDays: lastSevenDays,
        hhs: hhs
        }

app.listen 3001

pudding = (num, digit) ->
    strnum = "#{num}"[-digit..]
    ("0" for i in [strnum.length...digit]).reduce(((x,y)->x+y), "")+strnum

getYymmdd = (date) ->
    yy = pudding "#{date.getYear()}", 2
    mm = pudding "#{date.getMonth()+1}", 2
    dd = pudding "#{date.getDate()}", 2
    yymmdd = yy+mm+dd

daysAgo = (date, i) ->
    targDate = new Date(date)
    targDate.setTime(date.getTime() - i*24*60*60*1000)
    targDate

#!/usr/bin/env ruby




d = message.date.getutc.strftime("%FT%H:%MZ")

e = message.from.longname.rjust(64 - 1 - d.length)

d + " " + e



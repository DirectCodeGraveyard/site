import webapp2

class PubBadge(webapp2.RequestHandler):
    def get(self):
        print("Calling PubBasge")
        self.response.headers['Content-Type'] = 'image/svg+xml'
        pkg_name = self.request.path[10:][:-3]
        print(pkg_name)
        self.response.write(pkg_name)

application = webapp2.WSGIApplication([
    ('/pub_badge/<package>.svg', PubBadge),
], debug=True)
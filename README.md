MetaRoR
====

MetaRoR is like RoR except instead of using ActiveRecord to interact with a database it uses Pathname interact with a ProtoRoR. What is a ProtoRoR you ask, why it's the opposite of a MetaRoR! Confused? ProtoRoRs and MetaRoRs are both RoR installations except that one is nested inside the other!

What can I do with a MetaRoR
====

At the moment, not much.. I mean I suppose you can use it as a single page CMS.. that requires two parallel servers running (one for the MetaRoR and one for the ProtoRoR). That doesn't sound exciting but once I've made a bit more progress you'll be able to make anything you could make with a RoR except with hopefully minimal programming expertise! I mean, that's the goal.. it sounds ambitious.. we'll see what happens.

The plan
====

1. Build all of the controllers listed in the MetaRoR routes file
2. Make editing files nicer (use a real text editer, add new, create, and destroy actions, etc..)
3. Build a graphical editing environment for each file type (model, view, controller, script, stylesheet, routes)
4. Make it user friendly.. I suspect that there are things I want people to be able to do with models that will be logistically complex.. we'll want to bounce things off of some actual non-programmers at this stage.. in principal people who never read http://qntm.org/gay will find themselves in need of migrations (and in need of reading http://qntm.org/gay)
5. Start adding common gems like devise
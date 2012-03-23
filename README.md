# boston-ruby

This tool lets you look up recent activity by BostonRB members from the command
line.

      Usage:  boston-ruby [command]

      Commands:
          m                Show recent BostonRB mailing list posts
          t                Show recent tweets by BostonRB members
          g                Show recent github activity by BostonRB members
          b                Show recent blog posts
          e                Show next BostonRB event
          w                Show current Boston weather

## Install

    gem install boston-ruby

## Alias or wrap in a bash script

If you want to save a few keystrokes when you invoke the command, put something like

    alias brb=boston-ruby
    
in your `~/.bash_profile` and use your alias.

Or you can write a executable wrapper script -- I named mine `brb` -- like this to always pipe the output to `less +G`:

    #!/bin/bash
    boston-ruby $1 | less +G


## Sample output


BostonRB mailing list activity:

    $ boston-ruby m

    Re: [boston.rb] tethering/hotspot/mifi suggestions
    --------------------------------------------------
    http://groups.google.com/group/boston-rubygroup/browse_thread/thread/59bb3867e9924ac6

       John Norman : Just out of curiosity: Did putting this:                    
     07:49PM 03/14 : ServerAliveInterval 60 (or a smaller interval.) in your     
                   : .ssh/config help at all? (E.g.:                             
                   : [http://www.kehlet.cx/articles/129.html])                   

       Daniel Choi : No I haven't. I didn't even know about that option. Thanks, 
     07:50PM 03/14 : I'll try it!                                                

       Dan Pickett : If you have an android device, I highly recommend PDANet -  
     07:52PM 03/14 : it has made this surburbanite's ride on the commuter rail   
                   : very efficient!                                             
    [...]


BostonRB member tweets:

    $ boston-ruby t

         jayroh : Another beautiful site from the friendly people at          : 04:09PM 03/20
                : @the47th - http://t.co/HA1qqIQx                             :
        kbedell : The latest Browser market shares: http://t.co/Uu5cTGyQ      : 04:57PM 03/20
        kbedell : Found an annoying javascript bug that only occurs in        : 04:58PM 03/20
                : Firefox 3.6. Crap. Who's still supporting that version?     :
    im_a_muppet : You know you have been pairing a little too much when tmux  : 05:05PM 03/20
                : makes it into a pun! #ALittleTooMux                         :
      wpeterson : From my amazing coworkers: The Devops Dark Knight -         : 05:08PM 03/20
                : http://t.co/awWxeEbi #in                                    :
         dwhsix : @WorkBarBoston so you're "torqued", but are you still       : 05:09PM 03/20
                : hosting @sqoot 's event?                                    :
    bcardarella : @jayroh btw we haven't gotten a drink in a while. We        : 06:00PM 03/20
                : should fix that                                             :
         jayroh : @bcardarella no shit dude. Been a while!                    : 06:05PM 03/20
      wpeterson : @teflonted can't do it in Gemfile.  Bundle config.          : 06:55PM 03/20
         dwhsix : Ha, never looked at headers in a Facebook email:            : 07:13PM 03/20
                : X-Facebook: from zuckmail ([MTI3LjAuMC4x]) by               :
                : http://t.co/xFrkqvTy with HTTP (ZuckMail);                  :
    doctorzaius : Lots of new movies that I want to see, but someone might    : 07:23PM 03/20
                : call me a "sheeple" so I better not.                        :
    [...]

BostonRB member github activity:

    $ boston-ruby g

          cldwalker : cldwalker pushed to master at cldwalker/bacon               : 05:49PM 03/20
      berkmancenter : berkmancenter created repository brkmn                      : 05:53PM 03/20
            sbisker : sbisker started watching Kicksend/mailcheck                 : 05:55PM 03/20
        techiferous : techiferous pushed to master at techiferous/tabulous        : 05:58PM 03/20
        techiferous : techiferous created tag v1.3.0  at techiferous/tabulous     : 05:58PM 03/20
        techiferous : techiferous commented on pull request 14 on                 : 06:02PM 03/20
                    : techiferous/tabulous                                        :
        techiferous : techiferous commented on issue 13 on techiferous/tabulous   : 06:04PM 03/20
        techiferous : techiferous closed issue 13 on techiferous/tabulous         : 06:04PM 03/20
    robbfitzsimmons : robbfitzsimmons pushed to master at                         : 06:08PM 03/20
                    : robbfitzsimmons/sample_app                                  :
          cldwalker : cldwalker created branch fix_change_tests  at               : 06:10PM 03/20
                    : cldwalker/bacon                                             :
          cldwalker : cldwalker pushed to fix_change_tests at cldwalker/bacon     : 06:19PM 03/20
          cldwalker : cldwalker opened pull request 11 on chneukirchen/bacon      : 06:25PM 03/20
          cldwalker : cldwalker commented on pull request 10 on                   : 06:26PM 03/20
                    : chneukirchen/bacon                                          :
             croaky : croaky opened issue 9 on copycopter/style-guide             : 06:37PM 03/20
            jferris : jferris created repository jferris.github.com               : 06:38PM 03/20
            jferris : jferris created branch master  at                           : 06:39PM 03/20
                    : jferris/jferris.github.com                                  :
            jferris : jferris pushed to master at jferris/jferris.github.com      : 06:44PM 03/20
    [...]

## Not seeing yourself in the output?

To get your tweets included in the output, go to this BostonRB wiki page and
add your name and Twitter handle:

https://github.com/bostonrb/bostonrb/wiki/All-Rubyists

If your GitHub activity is not showing, try updating your GitHub user location to
one of these locations. It's case-insensitive.

    - cambridge, ma
    - boston
    - boston, ma
    - somerville, ma
    - salem, ma
    - providence, ri
    - salem, ma
    - portsmouth, nh
    - portland, me


If your location is not shown but ought to be included in the BostonRB
community, please post an issue.



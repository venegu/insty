# Project 6 - *Insty*

**Insty** is a photo sharing app using Parse as its backend.

Time spent: **14** hours spent in total

## User Stories

The following **required** functionality is completed:

- [x] User can sign up to create a new account using Parse authentication
- [x] User can log in and log out of his or her account
- [x] The current signed in user is persisted across app restarts
- [x] User can take a photo, add a caption, and post it to "Instagram"
- [x] User can view the last 20 posts submitted to "Instagram"

The following **optional** features are implemented:

- [x] Show the username and creation time for each post
- [x] After the user submits a new post, show a progress HUD while the post is being uploaded to Parse.
- [x] User Profiles:
   - [x] Allow the logged in user to add a profile photo
   - [x] Display the profile photo with each post
   - [x] Tapping on a post's username or profile photo goes to that user's profile page

The following **additional** features are implemented:

- [x] Obfuscated my own Parse account credentials by placing them in a seperate plist file that is in my .gitignore. To run this app see [instructions](https://github.com/venegu/insty#installation) below.
- [x] Added a diagonal gradient in the login view (kindof like the actual Instagram app).
- [x] Made the image view circular, similar to the Instagram app.
- [x] Wrote a reusable text field class (outside of the VC) that makes the text fields in the login view look similar to the actual Instagram app text fields.
- [x] Wrote a reusable button class (outside of the VC) that makes the buttons in the login view look similar to the actual Instagram app buttons.
- [x] When the buttons are clicked they are animated and change size using pop.
- [x] Created a rather swell UI with icons and pretty things that looks similar to the Instagram app (with my own touches).
- [x] Accounted for user not typing anything into the form in the login view (the buttons are un-enabled until a password is provided).
- [x] When the password text field is edited the buttons opacity is animated and increased, similar to the Instagram app. And if there is text typed into the password text field the opacity increases otherwise it decreases signifying that the buttons won't work if tapped (UX things I guess?).
- [x] Hiding password entry in the login view.
- [x] Auto layout @_ @.
- [x] Hides navigation bar when swiping on the feed table view while simultaneously allowing the user to tap the status bar and scroll to the top and redisplaying the navigation bar, very similar to the actual Instagram app.
- [x] Upon posting an image to parse the app segues back to the feed view and will display the recently added post and caption.
- [x] Using a tap gesture to exit text field editing view.
- [x] Adding refreshing upon pulling down the table view __NOTE:__ This feature is not pictured in the video walkthrough because I need someone else to compile my code and post a status for me to test this.

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1.
2.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://github.com/venegu/insty/raw/master/insty.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Installation

To run this app you will need to provide your own [Parse credentials](https://dashboard.heroku.com/new?button-url=https%3A%2F%2Fgithub.com%2FParsePlatform%2Fparse-server-example&template=https%3A%2F%2Fgithub.com%2FParsePlatform%2Fparse-server-example) and create a with these values `key.plist` file.

The function that handles the secret values is called `retrieveKeys()` and can be found in the `AppDelegate.swift`.

## Notes

A problem that I still have currently is how slowly the images are loading (in general) and how scrolling causes the app to try to fetch images for the cell (whoops)... I think in the future I will try to load all the images (first 20) first somehow and then display the view to the user, instead of having the images being pulled from the server when you scroll on the cell.

## Credits

   - All of the icons IN the app are from [Icons8](https://icons8.com)
   - The super cute app icon is by [Tahsin Tahil](https://www.iconfinder.com/tahsintahil) from [Iconfinder](https://www.iconfinder.com/icons/381384/instagram_logo_icon#size=128)

## License

    Copyright [2016] [Lisa Maldonado]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
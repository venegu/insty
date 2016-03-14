# Project 6 - *Insty*

**Insty** is a photo sharing app using Parse as its backend.

Time spent: **9** hours spent in total

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

- [x] Added a diagonal gradient in the login view!
- [x] Modified the UITextFields to look more like the UITextFields in the login view of the Instagram app using a class.
- [x] Created a rather swell UI with icons and pretty things that looks similar to the Instagram app (with my own touches).
- [x] Accounted for user not typing anything into the form in the login view (the buttons are un-enabled until a password is provided).
- [x] When the password text field is edited the buttons opacity is animated, similar to the Instagram app. If there is text typed into the password text field the opacity increases otherwise it decreases signifying that the buttons won't work if tapped (UX things I guess?).
- [x] Hiding password entry.
- [x] Auto layout @_@.
- [x] Hides navigation bar when swiping on the feed table view, like the Instagram app.
- [x] Upon posting an image to parse the app segues back to the feed view and will display the recently added post and caption (albeit the way I did it was hacky because I was in a hurry :P).

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1.
2.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<!--<img src='http://i.imgur.com/link/to/your/gif/file.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />-->

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.

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
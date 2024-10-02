# Safety Check

This Safety Check script helps protect your Roblox game from problematic players by utilizing Ruben Sim's database of flagged accounts. You can view the source code or download the latest file from the Releases section.

## Quick Setup Guide
1. Download the latest release from the Releases section.
2. Drag the file into Roblox Studio to open it.
3. Inside the main folder, locate the "Quick Setup" folder. This contains the pre-configured script that takes care of everything for you!
4. Refer to the "Modes" section below to learn how to adjust the script to your needs.

## Module Setup Guide
1. Download the latest release.
2. Open the file in Roblox Studio by dragging it in.
3. Look for the module inside the "Custom Setup" folder.

## Customizing the Quick Setup
To customize the Quick Setup:
1. Open the script named "SafetyChecker" inside the "Quick Setup" folder.
2. Locate the "CONFIG" section. Here are the customization options:
    - **LENIENT**: Kicks the player until they remove flagged friends.
    - **STRICT**: Permanently bans the player from your game (alt accounts not included).
    - **VSTRICT**: Permanently bans both the player and all associated alt accounts.
3. You can also modify:
    - `messageToModeration`: The reason sent to moderation.
    - `messageToUser`: The message displayed to the user.

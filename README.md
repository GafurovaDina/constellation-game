# Star Connector

A constellation creation game where you are up against time to connect stars before they drift off screen.

## How to Play

### Getting Started
1. Run the game in Processing
2. Click "Start Game" to begin
3. You have 30 seconds to create as many constellations as possible

### Controls
- **Mouse Click**: Select stars to add them to your constellation
- **Enter**: Save your current constellation and earn points
- **R**: Reset your current constellation (clears selection without saving)
- **Q**: Quit the game early

### Objective
Collect points by connecting stars. Click them in sequence to form constellations, then save your constellations before they drift off the edge of the screen.

## Game Mechanics

### Star Movement
The starfield constantly drifts to the left, gradually accelerating as the timer progresses. This creates an increasing challenge as the game continues.

### Creating Constellations
- Click on stars to connect them in sequence
- You need at least 2 stars to form a valid constellation
- Selected stars appear larger and are connected by white lines
- Stars cannot be reused once they're part of a saved constellation

### Saving Constellations
Press **Enter** to save your constellation
- If any star in your constellation touches the screen edge when you press Enter, the constellation won't be saved
- You must save before stars drift off screen
- Once saved constellations remain visible even when touching the edges
- Saved constellations disappear only when completely off-screen

### Losing a Constellation
Your current (unsaved) constellation will be automatically cleared if
- Any star in the selection touches the edge of the screen
- You press R to manually reset

### Scoring System
Points are awarded based on the number of stars in your constellation:

| Stars | Points |
|-------|--------|
| 2     | 40     |
| 3     | 90     |
| 4     | 160    |
| 5     | 250    |
| 6     | 360    |
| 7     | 490    |
| 8     | 640    |
| 9     | 810    |
| 10    | 1,000  |
| 11    | 1,210  |
| 12    | 1,440  |
| 13    | 1,690  |
| 14    | 1,960  |
| 15    | 2,250  |
| 16    | 2,560  |
| 17    | 2,890  |
| 18    | 3,240  |
| 19    | 3,610  |
| 20    | 4,000  |

The scoring is exponential, so larger constellations earn significantly more points.

## Requirements

- Processing 3.0 or higher
- Java mode

## Installation

1. Download or clone this repository
2. Open `constellation_game.pde` in Processing
3. Run the sketch

## Files

- `constellation_game.pde` - Main game file
- `GameManager.pde` - Game state and UI management
- `Star.pde` - Star object class
- `Timer.pde` - Timer functionality



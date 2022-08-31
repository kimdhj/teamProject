// Create new wheel object specifying the parameters at creation time.
let theWheel = new Winwheel({
  numSegments: 24, // Specify number of segments.
  outerRadius: 212, // Set radius to so wheel fits the background.
  innerRadius: 120, // Set inner radius to make wheel hollow.
  textFontSize: 16, // Set font size accordingly.
  textMargin: 0, // Take out default margin.
  // Define segments including colour and text.
  segments: [
    { fillStyle: "#e7706f", text: "500P" },
    { fillStyle: "#7de6ef", text: "10P" },
    { fillStyle: "#89f26e", text: "20P" },
    { fillStyle: "#7de6ef", text: "10P" },
    { fillStyle: "#89f26e", text: "20P" },
    { fillStyle: "#7de6ef", text: "10P" },
    { fillStyle: "#89f26e", text: "20P" },
    { fillStyle: "#7de6ef", text: "10P" },
    { fillStyle: "#eae56f", text: "100P" },
    { fillStyle: "#7de6ef", text: "10P" },
    { fillStyle: "#89f26e", text: "20P" },
    { fillStyle: "#7de6ef", text: "10P" },
    { fillStyle: "#89f26e", text: "20P" },
    { fillStyle: "#7de6ef", text: "10P" },
    { fillStyle: "#89f26e", text: "20P" },
    { fillStyle: "#7de6ef", text: "10P" },
    { fillStyle: "#eae56f", text: "100P" },
    { fillStyle: "#7de6ef", text: "10P" },
    { fillStyle: "#89f26e", text: "20P" },
    { fillStyle: "#7de6ef", text: "10P" },
    { fillStyle: "#89f26e", text: "20P" },
    { fillStyle: "#7de6ef", text: "10P" },
    { fillStyle: "#89f26e", text: "20P" },
    { fillStyle: "#7de6ef", text: "10P" },
  ],
  // Define spin to stop animation.
  animation: {
    type: "spinToStop",
    duration: 5,
    spins: 8,
    callbackFinished: alertPrize,
  },
});

// Vars used by the code in this page to do power controls.
let wheelPower = 3;

// -------------------------------------------------------
// Click handler for spin button.
// -------------------------------------------------------
function startSpin() {
  // Ensure that spinning can't be clicked again while already running.

  // Based on the power level selected adjust the number of spins for the wheel, the more times is has
  // to rotate with the duration of the animation the quicker the wheel spins.
  if (wheelPower == 1) {
    theWheel.animation.spins = 3;
  } else if (wheelPower == 2) {
    theWheel.animation.spins = 8;
  } else if (wheelPower == 3) {
    theWheel.animation.spins = 15;
  }

  // Disable the spin button so can't click again while wheel is spinning.

  // Begin the spin animation by calling startAnimation on the wheel object.
  theWheel.startAnimation();

  // Set to true so that power can't be changed and spin button re-enabled during
  // the current animation. The user will have to reset before spinning again.
}

// -------------------------------------------------------
// Function for reset button.
// -------------------------------------------------------

// -------------------------------------------------------
// Called when the spin animation has finished by the callback feature of the wheel because I specified callback in the parameters.
// note the indicated segment is passed in as a parmeter as 99% of the time you will want to know this to inform the user of their prize.
// -------------------------------------------------------
function alertPrize(indicatedSegment) {
  // Do basic alert of the segment text. You would probably want to do something more interesting with this information.
  alert("You have won " + indicatedSegment.text);
  theWheel.stopAnimation(false); // Stop the animation, false as param so does not call callback function.
  theWheel.rotationAngle = 0; // Re-set the wheel angle to 0 degrees.
  theWheel.draw(); // Call draw to render changes to the wheel.
}

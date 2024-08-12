String angleToCardinalDirection(double angle) {
  angle %= 360;

  // Check angle ranges for each cardinal direction
  if (angle >= 0 && angle < 22.5) {
    return 'شمال';
  } else if (angle >= 22.5 && angle < 67.5) {
    return 'شمال شرقي';
  } else if (angle >= 67.5 && angle < 112.5) {
    return 'شرق';
  } else if (angle >= 112.5 && angle < 157.5) {
    return 'جنوب شرقي';
  } else if (angle >= 157.5 && angle < 202.5) {
    return 'جنوب';
  } else if (angle >= 202.5 && angle < 247.5) {
    return 'جنوب غرب';
  } else if (angle >= 247.5 && angle < 292.5) {
    return 'غرب';
  } else if (angle >= 292.5 && angle < 337.5) {
    return 'شمال غرب';
  } else {
    return 'شمال';
  }
}

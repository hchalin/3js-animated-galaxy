uniform float uSize;
uniform float uTime;

attribute float aScale;

varying vec3 vColor;

 void main(){
   /**
  * Position
  */
  vec4 modelPosition = modelMatrix * vec4(position, 1.0);
  // Spin
  float angle = atan(modelPosition.x, modelPosition.z);
  float distanceToCenter = length(modelPosition.xz);
  float angleOfset = (1.0 / distanceToCenter) * uTime * 0.2;
  angle += angleOfset;
  modelPosition.x = cos(angle) * distanceToCenter;
  modelPosition.z = sin(angle) * distanceToCenter;

  vec4 viewPosition = viewMatrix * modelPosition;
  vec4 projectedPosition = projectionMatrix * viewPosition;

  gl_Position = projectedPosition;


  /**
  * Points
  */
  gl_PointSize = uSize * aScale;
  // Add size attenuation
  gl_PointSize *= ( 1.0 / - viewPosition.z );

  /**
  *
  */
  vColor = color;
 }

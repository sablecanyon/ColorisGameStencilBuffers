Shader "Custom/Bdiagram"
{
    
	SubShader{
		Tags{
				"RenderType"="Opaque" 
				"Queue"="Geometry"
			}
        Cull Off
		Pass{

            Stencil{
                Ref 3
                Comp always
                Pass replace
            }

			CGPROGRAM
			#include "UnityCG.cginc"

			#pragma vertex vert
			#pragma fragment frag

			struct appdata{
				float4 vertex : POSITION;
			};

			struct v2f{
				float4 position : SV_POSITION;
			};

			v2f vert(appdata v){
				v2f o;
				o.position = UnityObjectToClipPos(v.vertex);
				return o;
			}

			fixed4 frag(v2f i) : SV_TARGET{
                //FOR BLUE SHAPE
				return fixed4(0.24, 0.31, 0.72, 1);
			}

			ENDCG
		}
		Pass{

            Stencil{
                Ref 1
                Comp Equal
                Pass IncrSat 
                Fail IncrSat
            }

			CGPROGRAM
			#include "UnityCG.cginc"

			#pragma vertex vert
			#pragma fragment frag

			struct appdata{
				float4 vertex : POSITION;
			};

			struct v2f{
				float4 position : SV_POSITION;
			};

			v2f vert(appdata v){
				v2f o;
				o.position = UnityObjectToClipPos(v.vertex);
				return o;
			}

			fixed4 frag(v2f i) : SV_TARGET{
                //FOR BLUE SHAPE
				return fixed4(0.61, 0.1, 0.69, 1);
			}

			ENDCG
		}






	}
}

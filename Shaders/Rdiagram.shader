Shader "Custom/Rdiagram"
{
    
	SubShader{
		Tags{
				"RenderType"="Opaque"
				"Queue"="Geometry"
			}
        Cull Off
		Pass{

            Stencil{
                Ref 1
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
                //FOR RED SHAPE
				return fixed4(0.95, 0.25, 0.19, 1);
			}

			ENDCG
		}




		Pass{

            Stencil{
                Ref 3
                Comp equal
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
                //FOR RED SHAPE
				return fixed4(1, 1, 1, 1);
			}

			ENDCG
		}





	}
}

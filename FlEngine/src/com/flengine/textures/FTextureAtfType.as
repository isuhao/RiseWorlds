﻿package com.flengine.textures
{
    import com.flengine.error.*;

    public class FTextureAtfType extends Object
    {
        public static const ATF_Type_None:int = 0;
        public static const ATF_Type_Dxt1:int = 1;
        public static const ATF_Type_Dxt5:int = 2;

        public function FTextureAtfType()
        {
            throw new FError(FError.CANNOT_INSTANTATE_ABSTRACT);
        }

        public static function isValid(param1:int) : Boolean
        {
            if (param1 == ATF_Type_Dxt1 || param1 == ATF_Type_Dxt5)
            {
                return true;
            }
            return false;
        }

    }
}

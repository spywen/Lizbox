/**
 * Created by laurent on 24/02/2014.
 */
function formatSizeUnits(bytes){
    if      (bytes>=1073741824) {bytes=(bytes/1073741824).toFixed(0)+' Go';}
    else if (bytes>=1048576)    {bytes=(bytes/1048576).toFixed(2)+' Mo';}
    else if (bytes>=1024)       {bytes=(bytes/1024).toFixed(2)+' Ko';}
    else if (bytes>1)           {bytes=bytes+' o';}
    else if (bytes==1)          {bytes=bytes+' o';}
    else                        {bytes='-';}
    return bytes;
}
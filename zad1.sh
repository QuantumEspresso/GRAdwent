#!/bin/bash

awk 'BEGIN{currScore=0;bestScore=0;currElf=0;bestElf=0;wasPrevBlanc=0}
{
    if (NF==0)
    {
        if (wasPrevBlanc)
            currElf++;
        if (currScore>bestScore)
        {
            bestScore=currScore;
            bestElf=currElf;
        }
        currScore=0;
        wasPrevBlanc=0;
    }
    else
    {
        currScore+=$1;
        wasPrevBlanc=1;
    }

}
END{
    if (currScore>bestScore)
    {
        bestScore=currScore;
        bestElf=currElf;
    }
    print bestScore;
}' $1

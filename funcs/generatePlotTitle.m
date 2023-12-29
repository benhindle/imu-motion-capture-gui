function title = generatePlotTitle(joint)
   switch(joint)
   case 'knee_R' 
      title = "Right knee";
   case 'knee_L' 
      title = "Left knee";
   case 'hip_R' 
      title = "Right hip";
   case 'hip_L'
      title = "Left hip";
   case 'ankle_R' 
      title = "Right ankle";
   otherwise
      title = "Left ankle";
   end
end

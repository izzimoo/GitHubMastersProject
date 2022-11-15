% [f1, fs] = audioread('./ArmLeg/armleg_limb.wav');
% [f2] = audioread('./ArmLeg/armleg_two.wav');
% [f3] = audioread('./ArmLeg/armleg_joint.wav');
% [f4] = audioread('./ArmLeg/armleg_muscle.wav');
% [f5] = audioread('./ArmLeg/armleg_skin.wav');
% [f6] = audioread('./ArmLeg/armleg_break.wav');
% [f7] = audioread('./ArmLeg/armleg_long.wav');
% [f8] = audioread('./ArmLeg/armleg_support.wav');
% [f9] = audioread('./ArmLeg/armleg_thigh.wav');
% [f10] = audioread('./ArmLeg/armleg_foot.wav');
% 
% randNo = randNumber();
% 
% combined = [zeros(round(fs*0.5),size(f1,2));f1;zeros(round(fs*randNo(1)),size(f1,2));
%     f2;zeros(round(fs*randNo(2)),size(f1,2));f3;zeros(round(fs*randNo(3)),size(f1,2));
%     f4;zeros(round(fs*randNo(4)),size(f1,2));f5;zeros(round(fs*randNo(5)),size(f1,2));
%     f7;zeros(round(fs*randNo(6)),size(f1,2));f8;zeros(round(fs*randNo(8)),size(f1,2))
%     f9;zeros(round(fs*randNo(9)),size(f1,2));f10;zeros(round(fs*randNo(10)),size(f1,2))];
% 
% disp(randNo)
% audiowrite('newsound.wav',combined, fs)

sounds1 = {'hi', 'bye'}; sounds{trial_number}
sounds2 = ["hi", "bye"];

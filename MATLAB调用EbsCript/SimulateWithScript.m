% EN: loading of EbsOpen-assembly, please adjust the path!
asmInfo = NET.addAssembly('C:\Program Files\Ebsilon13\EBSILONProfessional 13\EbsOpen.dll');

% EN: Instanciate EbsOpen.Application (starts Ebsilon)
app = EbsOpen.ApplicationClass;
oc = app.ObjectCaster;         

% EN: loads model - you need to have read and write access - copy to another place. e. g. D:\Temp\Block750.ebs
model = app.Open('C:\Users\54933\Desktop\Model1.ebs');

objects = model.Objects;

dsp_objects = objects.Item('Measuring_point');
dsp = oc.CastToComp46(dsp_objects);
measm = dsp.MEASM;
measm.Value = 500;

errors = app.NewCalculationErrors();
model.Simulate(errors);

power = oc.CastToPipe(objects.Item('Electric'));

% EN: write power to Matlab-console
% DE: Schreibt die Leistung in die Matlab-Console
I=power.Q.Value;

%model.ActivateProfile(0);

%model.Configuration.EbsScripts.ItemByEbsScriptIdReturnObject(0).Run;
               
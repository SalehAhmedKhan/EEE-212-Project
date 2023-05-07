function [t_out,vc_out,type,r,r2,lc1,lc2,v1,v2,freq]=sorter(data,source_type,input_type,r_check,r_val)

%r1 is already defined
r2=0;
lc1=0;
lc2=0;
v1=0;
v2=0;
freq=0;

ud_flag=0;

data=sortrows(data);

if(r_check==0)
    r=10^3;
else
    r=str2double(r_val);
end

time=data(:,1)';
vc=data(:,2)';

if(source_type==0)
    %type='AC';
    if(input_type==1)
        type=1;
        [r,lc1,v1,freq,t_out,vc_out]=ac_rc(time,vc,r);
    else
        type=2;
        [r,lc1,v1,freq,t_out,vc_out]=ac_rl(time,vc,r);
    end
    %ac done
else
    %type='DC';
    for i=1:length(vc)
        if(vc(i)<0)
            ud_flag=1;
            break;
        end
    end
    %%initial cond case
    if(vc(1)~=0 && vc(length(vc))~=0)
        if(input_type==1)
            type=10;
            [r,lc1,v1,v2,t_out,vc_out]=dc_sp_C_dis(time,vc,r);
        else
            type=11;
            [r,lc1,v1,v2,t_out,vc_out]=dc_sp_L_dis(time,vc,r);
        end
        return;
    end
    %%initial cond case
    if(issorted(flip(vc))==1)
        if(input_type==1)
            type=3;
            [r,lc1,v1,t_out,vc_out]=source_free_rc(time,vc,r);
        else
            type=4;
            [r,lc1,v1,t_out,vc_out]=source_free_rl(time,vc,r);
        end
        %source free done
    elseif(issorted(vc)==1)
        if(input_type==1)
            type=5;
            [r,lc1,v1,t_out,vc_out]=dcrc_with_source(time,vc,r);
        else
            type=6;
            [r,lc1,v1,t_out,vc_out]=dcrl_with_source(time,vc,r);
        end
        %with source done
    elseif(ud_flag==1)
        type=7;
        [r,lc1,lc2,v1,t_out,vc_out]=rlc_underdamped(time,vc,r);
    elseif(vc(length(vc))==0)
        type=8;
        [r,lc1,lc2,v1,t_out,vc_out]=rlc_critdamped(time,vc,r);
    else
        type=9;
        [r,lc1,lc2,v1,t_out,vc_out]=rlc_overdamped(time,vc,r);
    end
end
end
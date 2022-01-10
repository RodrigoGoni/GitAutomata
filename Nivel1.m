function [vx,vy,velmY,velmX,ysf,ysi,xsi,xsf,modo_de_control,modo_op,flag_disDesP] = Nivel1(ssMethodType,X_com,Y_com,yef,xef,cD,cS,sCarga,cAng,xCarro_pos,Parada,b_time,yCarro_pos,modo,theta,vel_Izmax,flag_emergencia,posF_flag)
persistent init_server;
persistent init_nodes;
persistent uaClient;
persistent var_node_in;
persistent var_node_out;
persistent vx_out vy_out velmY_out velmX_out ysf_out ysi_out xsi_out xsf_out modo_de_control_out modo_op_out flag_disDesP_out;

if (isempty(init_server))
    vx_out = 0;
    init_server = 0;
    init_nodes = 0;
    vy_out = 0;
    velmY_out = 0;
end
if init_server == 0
    init_server = 1 ;
    uaClient = opcua('localhost',4840);
    connect(uaClient,'PLC_RO','532');
end
if uaClient.isConnected == 1 && init_nodes == 0
    init_nodes = 1;
    var_node_in = findNodeByName(uaClient.Namespace,'INPUTS','-once');
    var_node_out = findNodeByName(uaClient.Namespace,'OUTPUTS','-once');
    vx_out = findNodeByName(var_node_out,vx,'-once');
end

if uaClient.isConnected == 1 && init_nodes == 1
    
end
end
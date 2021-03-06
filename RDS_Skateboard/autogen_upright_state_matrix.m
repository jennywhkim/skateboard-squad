function A = autogen_upright_state_matrix(I_pend,b1,b2,g,m_cart,m_pend,r_com_pend)
%AUTOGEN_UPRIGHT_STATE_MATRIX
%    A = AUTOGEN_UPRIGHT_STATE_MATRIX(I_PEND,B1,B2,G,M_CART,M_PEND,R_COM_PEND)

%    This function was generated by the Symbolic Math Toolbox version 8.5.
%    13-Apr-2020 15:27:31

t2 = I_pend.*m_cart;
t3 = I_pend.*m_pend;
t4 = m_cart+m_pend;
t5 = r_com_pend.^2;
t6 = m_cart.*m_pend.*t5;
t7 = t2+t3+t6;
t8 = 1.0./t7;
A = reshape([0.0,0.0,0.0,0.0,0.0,0.0,g.*m_pend.^2.*t5.*t8,g.*m_pend.*r_com_pend.*t4.*t8,1.0,0.0,-b1.*t8.*(I_pend+m_pend.*t5),-b1.*m_pend.*r_com_pend.*t8,0.0,1.0,-b2.*m_pend.*r_com_pend.*t8,-b2.*t4.*t8],[4,4]);

PGDMP      "        
        |         
   logging_db    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16657 
   logging_db    DATABASE     }   CREATE DATABASE logging_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE logging_db;
                postgres    false            �            1259    16669    logs    TABLE     �   CREATE TABLE public.logs (
    id integer NOT NULL,
    nombre_servicio character varying(50),
    nivel_log character varying(10),
    mensaje text,
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.logs;
       public         heap    postgres    false            �            1259    16668    logs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.logs_id_seq;
       public          postgres    false    216            �           0    0    logs_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.logs_id_seq OWNED BY public.logs.id;
          public          postgres    false    215            P           2604    16672    logs id    DEFAULT     b   ALTER TABLE ONLY public.logs ALTER COLUMN id SET DEFAULT nextval('public.logs_id_seq'::regclass);
 6   ALTER TABLE public.logs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �          0    16669    logs 
   TABLE DATA           N   COPY public.logs (id, nombre_servicio, nivel_log, mensaje, fecha) FROM stdin;
    public          postgres    false    216   �
       �           0    0    logs_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.logs_id_seq', 162, true);
          public          postgres    false    215            S           2606    16677    logs logs_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.logs DROP CONSTRAINT logs_pkey;
       public            postgres    false    216            �   t  x����n����S���G{�E��b��"� � k	�ȳ���#��r���ʁ��]��!�����U��Mw~|������o������z��������ק�/��ϗ�����t���o/����6/ě�f���&)���״�~��.�������������緗ק��?����H�6j'�a�������/O��o��z�w��������\~��u��C^ٙ������b	0��#���s�uJ�#�������߿��5����6�����:D�j_H_B������OO�R��T�p3)Dyh�֚�,���zƣ4�IB����rm����1�Dnx[�!�[��Y,�hA� �V3�Ʃ���	�sd%+[Pa*��[�D�[n����(�;ͣ�Rv�3��A}�|��nZX�m���5��h6�"q�#"8Ql���{U��g�z��'�;)@#�'W�WC�g+�K�`[�ev*<�%Hp|��h�Y� ���"t6���MGR�<(8��Lx9��XkqU�!H�.����i �|e=Ph6֛�YѫmB8�cFL'*�V�L��ԫOC(2Ӈ�6�!���U�e����.j2��iU-�Hⱖ�	�=�J���T�		���;R[tA��g�xj�E-O���(�HOO� 8�Z!-zN��֫�䆵��o81��
��9�(��Pe�h�0�m�I��P
�ڑT[Q.l�צ��عB�#��oT,e
I�nC�X^�#��.cx��X�����Y,?|$�Ɔ).kE�cSX��)]lcѺ�Qzb��vim;�\üQzj�������>�tΥ��;t�s�秱w
��G@�i,0���:��K�T0;����;�U���VM�Q���n�	*h鞎��Q��z�����·c�e$L{�#81&e�|�z�/�hp:�0�m�r��!Dՙ�`$���
��*57/ò�9@Z���i��|�An{���{� ��~h�	ݡp��$�M<���w7Q��|��Qa��XqJ�f��(���_(�@QX��0�xN��W�9��.oQq��_�2@L�|�T<-e`$���	̂��1�Js<�/�*��N�W�M!$��Rf;w�b���$�e��c`��#�L���L�D0is(�Kge��l@&�[�+��"\GÖ�2��LdpS-j�HWv��	�t��&��3�[#ї�:!j'����ۄ��V5z�:cx&/����v�
G-��G��;0kE�z�v `���1��/5��h���C����P[Qn��Đ8'��C�]���SK+w��Bm�2�gW�Ռf�38i�U[��&/b���m1�%.�nihd�wD'K��U�>"�+% ��߶�U�Hk�E#�������ՁY2
���D%�"тSҬ�l�N�	6ڟ�u��N���V�����{|[L��A�FVÁ��`���g8pp:&8lgKpP�ʐ�2�K�,�33O�P��4++v���kp8�����=s(G0�	�,�š�(����A���0�9�c��+M%��I�WΈ�G��u��k�w��u����^_����X�o"r�m�$�����{�/��g��l�M�S$�ex�xu��2H��"X��!9P���/�I�j¦��+�U|0��rY���7�X�I�(ř{�'>Ԑiq�rq7������>��c��)q�v�X�D�ƻ)��'7i��<�.�n$F���۴��`���LX� 㐣���a-,����A����"߶�ZmgQ��%KQ!�C�B��1ogI�"�<��<ƁA��qW�2K杣�ʈ�����N�i�$<�_ؙA�%��E�Ӧ� Y�C{���]�΁z��{���i�~��:�&i�?`i������/g��B     
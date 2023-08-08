#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��J�dSD_start.sh �W�o�T~�_q�F��v����Ra��D��͆&�*۹�-9��?�V�!�����JV� e[T���c)����O���M��i�js��{�=�;�~�=7CW$�����:�A�U�{����d�)���N�����Z�
\ͪV\�����TF5	���x:�Ё4�>t��f�����~�<��>�Iţ���GA㧃?��
ܲ�������m�zJv~��_�6�|���yІ��#�@v��J����>����!ܯ>�<h�7����:���<�~HZG�k|����(��]V<��3��)�	�r�Z2��FV���/82]�Bs�Xha���6�w�_���/b�8!����e��y�X���'�9>3U������,�}J1�|��R>��V���/�e1����s�b!Ǐ���#�)���l~���s�
��V�]�K�қ�毽.�:󰸀<�=�v�K��lK<��H�))��5$eR�����!mA��Dգ�N���U�d[�3ri*�<��R��	�Uv�b�ј�,��������bH�(M�d�`���w=x�1w>�%?|�=qT��$۱*��Ĳ�hD�A��3j�U�{f��-Y�g�5!��oH�%7s�4U,�On����o/gC��ZH������G�@)T��}|����S�G1O�}2�e����9�V+UZ�Tb`Gy��<h�yU�,��@���z,hmRa��%r�J�ß�x_:'��9��<�)��`¨T|װ0#�m����"��Y��2����Iio������`w���L�����W��#�(��R~|��W��1\a��!&�V���6��.�D��q���:,�Qv�Y��z>���y��6����-*u��K>k���4��${?S����O:������ˠ�K+BO9�v!����E`u�8I��H�U{�9̗���K\]q��p����@�� -yG[MC��/��ڟ�  
function x = moyenne(im)
    im = single(im);
    denominateur = max(sum(im,3),1);

    r = im(:,:,1)./denominateur;
    v = im(:,:,2)./denominateur;

    r_barre = mean(r(:));
    v_barre = mean(v(:));

    x = [r_barre v_barre];
end


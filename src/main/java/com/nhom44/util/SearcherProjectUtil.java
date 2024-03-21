package com.nhom44.util;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class SearcherProjectUtil {
    public static final PriceObjectHelper B1HM= new PriceObjectHelper(100000000l,"Dưới 100 triệu");
    public static final PriceObjectHelper B5HM= new PriceObjectHelper(500000000l,"Dưới 500 triệu");
    public static final PriceObjectHelper B1B= new PriceObjectHelper(1000000000l,"Dưới 1 tỷ");
    public static final PriceObjectHelper B1B5HM= new PriceObjectHelper(1500000000l,"Dưới 1,5 tỷ");
    public static final PriceObjectHelper B2B= new PriceObjectHelper(2000000000l,"Dưới 2 tỷ");
    public static final PriceObjectHelper B2B5HM= new PriceObjectHelper(2500000000l,"Dưới 2,5 tỷ");
    public static final PriceObjectHelper U2B5HM= new PriceObjectHelper(2500000000l,"Trên 2,5 tỷ");
    public static final List<PriceObjectHelper> PRICE_SEARCHING= Arrays.asList(B1HM,B5HM,B1B,B1B5HM,B2B,B2B5HM);
    public static final List<Integer> ACREAGE= Arrays.asList(50,100,150,200,250);


}

package eat_schedule.service;

import eat_schedule.mapper.ImgMapper;
import eat_schedule.mapper.StoreMapper;
import eat_schedule.dto.Store;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
@RequiredArgsConstructor
public class FindStore {
    private final StoreMapper storeMapper;

    private final ImgMapper imgMapper;

    public Store findStoreBySeq(int seq){
        return storeMapper.findStore(seq);
    }
    public ArrayList<Store> findAllScore(String district, String category, String name){
        ArrayList<Store> stores = storeMapper.findAllScore(district, category, name);
        for (Store store : stores) {
            store.setPicture_location(imgMapper.findMainImg(store.getSeq()));
            System.out.println(store.getPicture_location());
        }
        return stores;
    }
    public ArrayList<Store> findAllReview(String district, String category, String name){
        ArrayList<Store> stores = storeMapper.findAllReview(district, category, name);
        for (Store store : stores) {
            store.setPicture_location(imgMapper.findMainImg(store.getSeq()));
            System.out.println(store.getPicture_location());
        }
        return stores;
    }
    public ArrayList<Store> findAllWish(String district, String category, String name){
        ArrayList<Store> stores = storeMapper.findAllWish(district, category, name);
        for (Store store : stores) {
            store.setPicture_location(imgMapper.findMainImg(store.getSeq()));
            System.out.println(store.getPicture_location());
        }
        return stores;
    }
}

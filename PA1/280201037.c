
#include <stdio.h>
#include <stdlib.h>

typedef struct linked_list_node_t {
    void* data;
    struct linked_list_node_t* next;
} linked_list_node_t;
void create_array_of_linked_list_ptrs(linked_list_node_t*** destination, int size) {
    //Fill this body
    *destination = (linked_list_node_t**) malloc(size * sizeof(linked_list_node_t*));
    linked_list_node_t** array_of_ptr = *destination;
    for(int i = 0; i < size; i++){
        array_of_ptr[i] = NULL; 
    }
}
void get_element_of_array_of_linked_list_ptrs(linked_list_node_t** array, int index, linked_list_node_t** destination){
    //Fill this body
    linked_list_node_t* element = array[index];
    *destination = element;
}
void set_element_of_array_of_linked_list_ptrs(linked_list_node_t*** array, int index, linked_list_node_t** head) {
    //Fill this body
    linked_list_node_t** ptr_array = *array;
    ptr_array[index] = *head;  

}
void destroy_array_of_linked_list_ptrs(linked_list_node_t*** array) {
    //Fill this body
    free(*array);
    *array = NULL;
}
void resize_array_of_linked_list_ptrs(linked_list_node_t*** destination, linked_list_node_t*** array, int size, int new_size){
    //Fill this body
    *destination = (linked_list_node_t**) realloc(*array, new_size * sizeof(linked_list_node_t*));
    if (new_size > size) {
        for (int i = size; i < new_size; i++) {
            (*destination)[i] = NULL;
        }
    }
}

void create_link_list(linked_list_node_t** destination){
    //Fill this body
    *destination = NULL;
}
void destroy_linked_list(linked_list_node_t** head) {
    //Fill this body
    linked_list_node_t* current_node = *head;
    linked_list_node_t* next_node;
    while (current_node != NULL) {
        next_node = current_node->next;
        free(current_node);
        current_node = next_node; 
    }
    *head = NULL;
}
void add_to_linked_list(linked_list_node_t** head, const void* data) {
    //Fill this body
    linked_list_node_t* new_node = (linked_list_node_t*)malloc(sizeof(linked_list_node_t));
    linked_list_node_t* last = *head; 
    new_node->data = data;
    new_node->next = NULL;
 
    if (*head == NULL) {
        *head = new_node;
        return;
    }

    while (last->next != NULL){
        last = last->next;
    }
    last->next = new_node;
    return;
}
void remove_from_linked_list(linked_list_node_t** destination, linked_list_node_t** head, const void* data) {
    //Fill this body
    linked_list_node_t* temp = *head, *prev; 
  
    if (temp != NULL && temp->data == data) { 
        *head = temp->next; 
        free(temp); 
        return; 
    } 
    while (temp != NULL && temp->data != data) { 
        prev = temp; 
        temp = temp->next; 
    } 
    if (temp == NULL) 
        return; 
  
    prev->next = temp->next; 
    free(temp);  
}


typedef struct song_t {
    const char* name;
    float duration;
} song_t;
void create_song(song_t* destination, const char* name, float duration) {
    //Fill this body
    song_t song = {name, duration};
    *destination = song;
}


linked_list_node_t** array_of_playlist_ptrs = NULL;
int main(){
    //Fill this body
    create_array_of_linked_list_ptrs(&array_of_playlist_ptrs, 5);
    
    
    for(int i = 0; i < 5; i++){
        linked_list_node_t* playlist;
        create_link_list(&playlist);
        set_element_of_array_of_linked_list_ptrs(&array_of_playlist_ptrs,i,&playlist);
    }

    resize_array_of_linked_list_ptrs(&array_of_playlist_ptrs,&array_of_playlist_ptrs,5,10);

    for(int i = 5; i < 10; i++){
        linked_list_node_t* playlist;
        create_link_list(&playlist);
        set_element_of_array_of_linked_list_ptrs(&array_of_playlist_ptrs,i,&playlist);
    }

    song_t song;

    for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 4; j++) {
            int rnd;
            rnd = rand();
            song_t *song = malloc(sizeof(song_t)); 
            char* song_name = malloc(10);
            sprintf(song_name, "Playlist %d Song %d", i+1, j+1);
            create_song(song, song_name, rnd);
            add_to_linked_list(&array_of_playlist_ptrs[i], song); 
        }
    }
    for (int i = 0; i < 10; i++) {
        linked_list_node_t* second_song_node = array_of_playlist_ptrs[i]->next;
        if (second_song_node) {
            song_t* second_song = second_song_node->data;
            linked_list_node_t* node_to_remove;
            remove_from_linked_list(&node_to_remove, &array_of_playlist_ptrs[i], second_song);  
        }
    }


   for (int i = 0; i < 10; i++) {
        printf("Playlist #%d\n", i);
        linked_list_node_t* song;
        get_element_of_array_of_linked_list_ptrs(array_of_playlist_ptrs, i, &song);
        while (song != NULL) {
            song_t* song_data = song->data;
            printf("     Name: %s, Duration: %.6f\n", song_data->name, song_data->duration);
            song = song->next;
        }
    }

 
    for(int i = 0;i<10;i++){
        destroy_linked_list(&array_of_playlist_ptrs[i]);
    }
    destroy_array_of_linked_list_ptrs(&array_of_playlist_ptrs);


    return 0;
}